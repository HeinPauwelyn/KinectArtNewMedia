import java.util.ArrayList;

public class LineRepo {

        public static LineRepo instance;
	ArrayList<Line> list = new ArrayList<Line>();
	ArrayList<Line> removedLines = new ArrayList<Line>();

        public static LineRepo getInstance() {
      
            if (instance == null) {
                instance = new LineRepo();
            }
            
            return instance;
        }

	public void addLine(Line line){

		list.add(line);
	}

	public ArrayList<Line> getAllLines(){
		return list;
	}

	public void removeLine(Line line) {
		
		removedLines.add(line);
	}

	public void cleanUp(){

		for (Line line : removedLines) {
			list.remove(line);
		}
	}
}

