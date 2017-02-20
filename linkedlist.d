module datastructures.linkedlist;

import
    std.stdio,
	core.vararg;

class LinkedList(T)
{	
	protected struct Node
	{
		T data;
		Node* next;
	}

	protected Node* first;
	
	public this(T ele ...)
	{
		writeln("First arg: ", ele);
		//writeln("Number of args: ", _arguments.length);
		T l;
		while (l = va_arg!T(_argptr)) writeln(l);
	}
}

void main()
{
	auto a = new LinkedList!int(3);
	auto b = new LinkedList!int(3, 4, 5, 6);
}
