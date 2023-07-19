codeunit 50101 "Event Subscription"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Line", 'OnPostGLAccOnBeforeInsertGLEntry', '', false, false)]
    local procedure OnPostGLAccOnBeforeInsertGLEntry(var GenJournalLine: Record "Gen. Journal Line"; var GLEntry: Record "G/L Entry")
    begin
        GenJournalLine.TestField("TDS Amount");

        GLEntry."TDS Amount" := GenJournalLine."TDS Amount";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', false, false)]
    local procedure OnAfterCopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        SumAmt: Decimal;
    begin
        SalesLine.Reset();
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                SumAmt += SalesLine."Tax Amount";
            until SalesLine.Next() = 0;
        GenJournalLine."TDS Amount" := SumAmt;


    end;




}
