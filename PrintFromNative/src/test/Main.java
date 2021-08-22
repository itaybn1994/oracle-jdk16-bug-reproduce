package test;

public class Main
{
	static{
		System.loadLibrary("native");
	}
	
	private static native void print();
	
	public static void main(String[] args) {
		print();
	}
}

