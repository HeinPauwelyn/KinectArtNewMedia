public class LineRepo {

	ArrayList<SmartLine> list = new ArrayList<SmartLine>();
	ArrayList<SmartLine> removedLines = new ArrayList<SmartLine>();

	public void addLine(SmartLine line){

		list.add(line);
	}

	public ArrayList<SmartLine> getAllLines(){
		return list;
	}

	public void removeLine(SmartLine line) {
		
		removedLines.add(line);
	}

	public void cleanUp(){

		for (SmartLine line : removedLines) {
			list.remove(line);
		}
	}
}

