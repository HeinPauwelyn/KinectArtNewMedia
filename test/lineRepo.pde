public class LineRepo {

	ArrayList<Line> list = new ArrayList<Line>();
	ArrayList<Line> removedLines = new ArrayList<Line>();

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

