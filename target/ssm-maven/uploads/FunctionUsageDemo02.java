//��ʾstatic��ʹ��
class FunctionUsageDemo02 
{
	//����Ǿ�̬ȫ�ֱ���
	String str;

	//���徲̬ȫ�ֱ���
	static int num;

	//main�Ǿ�̬����
	public static void main(String[] args) 
	{
		show();
		//����һ����ͬһ�����У��ھ�̬�����в��ܵ��÷Ǿ�̬����
		// ����: �޷��Ӿ�̬�����������÷Ǿ�̬ ���� display()
		//display();

		//����������ͬһ�����У��ھ�̬������ֻ�ܷ��ʾ�̬ȫ�ֱ���
		// ����: �޷��Ӿ�̬�����������÷Ǿ�̬ ���� str
		//System.out.println(str);
		System.out.println(num);//0

		//����һ���ֲ�����
		//��ȫ�ֱ����;ֲ�����������ʱ�򣬷��ʵ�ʱ����þͽ�ԭ��
		//��������ȫ�ֱ����;ֲ���������
		int num = 10;
		System.out.println(num);
	}

	//��̬����
	public static void show() {
		System.out.println("show");
	}

	//�Ǿ�̬����
	public void display() {
		System.out.println("display");
		//���۶�����ͬһ�����У��Ǿ�̬�������Ե��þ�̬������Ҳ���Ե��÷Ǿ�̬����
		show();
		display11();

		//�����ģ���ͬһ�����У��Ǿ�̬�������Է��ʾ�̬ȫ�ֱ����Լ��Ǿ�̬ȫ�ֱ���
		System.out.println(str);
		System.out.println(num);
	}

	//�Ǿ�̬����
	public void display11() {
		System.out.println("display11");
	}
}
