tableextension 50100 "Sales&ReceivablesExt" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50100; purchasenoseries; Code[20])
        {
            Caption = 'purchasenoseries';
            DataClassification = ToBeClassified;
        }
        field(50101; billnos; Code[20])
        {
            Caption = 'billingnoseries';
            DataClassification = ToBeClassified;

        }


    }
}
