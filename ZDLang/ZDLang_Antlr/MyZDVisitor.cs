

using Antlr4.Runtime.Misc;
using Antlr4.Runtime.Tree;

public class MyZdVisitor: ZDBaseVisitor<object>
{
    public override object VisitImporter([NotNull] ZDParser.ImporterContext context)
    {
         Console.WriteLine("===importer=======" +  context.IDENTIFIER()[0].GetText());
        return base.VisitImporter(context);
    }

    public override object VisitFunc_call([NotNull] ZDParser.Func_callContext context)
    {
        foreach (var senten in context.valueSentence()) {
            Console.WriteLine("===func_call=======" +  senten.GetText());
        }
       
        return base.VisitFunc_call(context);
    }

    public override object VisitFunc([NotNull] ZDParser.FuncContext context)
    {
        Console.WriteLine("=====func=====" +  context.IDENTIFIER().GetText());
        return base.VisitFunc(context);
    }

    public override object VisitNamespace([NotNull] ZDParser.NamespaceContext context)
    {
         Console.WriteLine("===namespace=======" +  context.IDENTIFIER().GetText());
        return base.VisitNamespace(context);
    }

    public override object VisitClass([NotNull] ZDParser.ClassContext context)
    {
         Console.WriteLine("===class=======" +  context.IDENTIFIER().GetText());
        return base.VisitClass(context);
    }
}
