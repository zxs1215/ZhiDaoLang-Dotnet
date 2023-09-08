// See https://aka.ms/new-console-template for more information
using Antlr4.Runtime;
using System.IO;
using System.Text;

string filePath = "./example.md";
string str;
using (var reader = new StreamReader(filePath))
{
    str = reader.ReadToEnd();
}


AntlrInputStream stream = new AntlrInputStream(str);

ZDLexer lexer = new ZDLexer(stream);

CommonTokenStream tokenStream = new CommonTokenStream(lexer);

ZDParser parser = new ZDParser(tokenStream);

var result = new MyZdVisitor().Visit(parser.program());
