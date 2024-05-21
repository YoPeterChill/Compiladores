#include <iostream>
#include <vector>
#include <map>
#include <set>

using namespace std;

class Node {
protected:
        vector<Node*> children;

public:
        virtual string toStr() {
                return "node";
        }
};

class Integer : public Node {
protected:
        int value;
public:
        Integer(const int v){
                value = v;
        }

        virtual string toStr() override {
                return to_string(value);
        }

};

class Float : public Node {
protected:
        float value;
public:
        Float(const float v){
                value = v;
        }

        virtual string toStr() override {
                return to_string(value);
        }
};

class Ident : public Node {
protected:
        string name;
public:
        Ident(const string v){
                name = v;
        }

        virtual string toStr() override {
                return (name);
        }
};

class Unary : public Node {
protected:
        Node *value;
        char operation;

public:
        Unary(Node *v, char op){
                value = v;
                operation = op;
        }

        virtual string toStr() override {
                string aux;
                aux.push_back(operation);
                return;
        }
};

class BynaryOp: public Node {
protected:
    Node *value1;  
    Node *value2; 
    char operation;   

public:

    BynaryOp(Node *v1, Node *v2, char op) {
        value1 = v1;
        value2 = v2;
        operation = op;
    }

        virtual string toStr() override {
                string aux;
                aux.push_back(operation);
                return;
        }
};

class Print {
protected:
        Node *value;

public:
        Print(Node *v){
                value = v;
        }
        
        virtual string toStr() {
                return "node";
        }
};