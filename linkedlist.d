module datastructures.linkedlist;

import
    std.stdio,
	core.vararg,
	core.exception;

class LinkedList(T)
{	
	protected struct Node
	{
		T data;
		Node* next;

		this(T val, Node* next = null)
		{
			this.data = val;
			this.next = next;
		}
	}

	protected Node* _first;
	private int _count;
	
	public this()
	{
		_count = 0;
		_first = null;
		debug writeln("Initialized list");
	}

	@property int count() { return _count; }

	Node* nodeAt(int n)
	{
		debug writeln("Getting node at: ", n);

		Node* pt = _first;

		for (int i = 0; i < n; i++)
		{
			if (pt is null)
				break;
			pt = pt.next;
		}

		debug writeln("Made it to node ", n);
		
		return pt;
	}

	Node* endNode()
	{
		debug writeln("Getting last node");
		Node* pt = _first;
		while (pt !is null)
		{
			pt = pt.next;
			if (pt.next is null) break;
		}
		return pt;
	}
	
	void append(T val)
	{
		debug writeln("Appending new value: ", val);
		Node* last = endNode();

		if (last is null)
		{
			debug writeln("No nodes, adding new first node");
			_first = new Node(val);
		}
		else
			last.next = new Node(val);

		debug writeln("Allocated and set new node");
		_count += 1;
		//return this;
	}

	T at(int n)
	{
		debug writeln("Getting element at ", n);
		return nodeAt(n).data;
	}
			
}

void main()
{
	auto a = new LinkedList!int();
	a.append(5);
	a.append(2);
	writeln("Count is ", a.count);
	writeln("First element: ", a.at(0));
	writeln("Second element: ", a.at(1));
}
