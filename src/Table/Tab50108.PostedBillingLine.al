table 50108 PostedBillingLine
{
    Caption = 'PostedBillingLine';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Item No"; Code[20])
        {
            Caption = 'Item No';

        }
        field(3; "Item Description"; Text[200])
        {
            Caption = 'Item Description';
        }
        field(4; Qty; Integer)
        {
            Caption = 'Qty';
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }
        field(6; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
        }
        field(7; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
        }
        field(8; "Line No"; Integer)
        {
            Caption = 'Line No';
        }


    }
    keys
    {
        key(PK; "Document No", "Line No")
        {
            Clustered = true;
        }
    }
}
