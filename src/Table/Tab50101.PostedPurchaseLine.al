table 50101 PostedPurchaseLine
{
    Caption = 'PostedPurchaseLine';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Qty; Integer)
        {
            Caption = 'Qty';
        }
        field(5; "Unit Price"; Integer)
        {
            Caption = 'Unit Price';
        }
        field(6; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
        }
        field(7; "Item Name"; Text[200])
        {
            Caption = 'Item Name';
        }
        field(21; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
