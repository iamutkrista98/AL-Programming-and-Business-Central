pageextension 50100 "Sales&ReceivablesExt" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Customer Nos.")
        {
            field(purchasenoseries; Rec.purchasenoseries)
            {
                ApplicationArea = All;
                TableRelation = "No. Series";
            }
            field(billnos; Rec.billnos)
            {
                ApplicationArea = All;
                TableRelation = "No. Series";
            }

        }
    }
}
