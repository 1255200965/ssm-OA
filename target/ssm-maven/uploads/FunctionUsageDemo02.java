//演示static的使用
class FunctionUsageDemo02 
{
	//定义非静态全局变量
	String str;

	//定义静态全局变量
	static int num;

	//main是静态函数
	public static void main(String[] args) 
	{
		show();
		//结论一：在同一个类中，在静态函数中不能调用非静态函数
		// 错误: 无法从静态上下文中引用非静态 方法 display()
		//display();

		//结论三：在同一个类中，在静态函数中只能访问静态全局变量
		// 错误: 无法从静态上下文中引用非静态 变量 str
		//System.out.println(str);
		System.out.println(num);//0

		//定义一个局部变量
		//当全局变量和局部变量重名的时候，访问的时候采用就近原则
		//尽量避免全局变量和局部变量重名
		int num = 10;
		System.out.println(num);
	}

	//静态函数
	public static void show() {
		System.out.println("show");
	}

	//非静态函数
	public void display() {
		System.out.println("display");
		//结论二：在同一个类中，非静态函数可以调用静态函数，也可以调用非静态函数
		show();
		display11();

		//结论四：在同一个类中，非静态函数可以访问静态全局变量以及非静态全局变量
		System.out.println(str);
		System.out.println(num);
	}

	//非静态函数
	public void display11() {
		System.out.println("display11");
	}
}
