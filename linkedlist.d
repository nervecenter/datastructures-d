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
		debug writeln("Initialized list.");
	}

	@property int count() { return _count; }

	Node* nodeAt(int n)
	{
		debug writeln("Getting node at: ", n);

		Node* pt = _first;
		
		while (pt !is null)
		{
			n -= 1;
			if (n == 0) break;
			pt = pt.next;
		}

		debug writeln("Got to node.");
		
		return pt;
	}

	Node* endPointer()
	{
		debug writeln("Getting end pointer.");
		if (count == 0)
		{
			debug writeln("No elements, returning _first pointer.");
			return _first;
		}
		debug writeln("Getting last node's pointer.");
		return nodeAt(count - 1).next;
	}
	
	void append(T val)
	{
		debug writeln("Appending new value.");
		Node* endPt = endPointer();
		endPt = new Node(val);
		debug writeln("Allocated and set new node.");
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
	writeln(a.count);
	writeln(a.at(0));
	writeln(a.at(1));
}
