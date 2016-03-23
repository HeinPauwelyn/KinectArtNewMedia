using Microsoft.Kinect;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KinectArt.CSharp.App
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private KinectSensor sensor;
        private WriteableBitmap colorBitmap;

        public MainWindow()
        {
            InitializeComponent();
            Loaded += WindowLoaded;
            Closed += WindowClosed;
        }

        private void WindowClosed(object sender, EventArgs e)
        {
            sensor?.Stop();
        }

        private void WindowLoaded(object sender, RoutedEventArgs e)
        {
            LoadKinect();
        }

        private void LoadKinect()
        {
            foreach (KinectSensor potentialSensor in KinectSensor.KinectSensors)
            {
                if (potentialSensor.Status == KinectStatus.Connected)
                {
                    this.sensor = potentialSensor;
                    break;
                }
            }

            if(sensor != null)
            {
                //Enable'n
                sensor.DepthStream.Enable();
                sensor.SkeletonStream.Enable();
                sensor.ColorStream.Enable();

                colorBitmap = new WriteableBitmap(this.sensor.ColorStream.FrameWidth, this.sensor.ColorStream.FrameHeight, 96.0, 96.0, PixelFormats.Gray16, null);

                Image.Source = colorBitmap;

                //Event aanmaken
                sensor.AllFramesReady += Sensor_AllFramesReady;

                //Starten
                sensor.Start();
            }
        }

        private void Sensor_AllFramesReady(object sender, AllFramesReadyEventArgs e)
        {
            using (ColorImageFrame colorFrame = e.OpenColorImageFrame())
            {
                if (colorFrame != null)
                {
                    // Copy the pixel data from the image to a temporary array
colorFrame.CopyPixelDataTo(new byte[this.sensor.ColorStream.FramePixelDataLength]);

                    // Write the pixel data into our bitmap
                    colorBitmap.WritePixels(
                        new Int32Rect(0, 0, this.colorBitmap.PixelWidth, this.colorBitmap.PixelHeight),
                        new byte[this.sensor.ColorStream.FramePixelDataLength],
                        this.colorBitmap.PixelWidth * colorFrame.BytesPerPixel,
                        0);
                }
            }
        }
    }
}
