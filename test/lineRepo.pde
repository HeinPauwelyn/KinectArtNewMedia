public class LineRepo {

	ArrayList<Line> list = new ArrayList<Line>();

	public void addLine(Line line){

		list.add(line);
	}

	public ArrayList<Line> getAllLines(){
		return list;
	}
}

