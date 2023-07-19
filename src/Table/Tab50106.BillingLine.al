table 50106 "Billing Line"
{
    Caption = 'Billing Line';
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
            TableRelation = Item;
            trigger OnValidate()
            var
                Itm: Record Item;
                BillingLine: Record "Billing Line";
            begin
                if Itm.Get("Item No") then begin
                    Validate("Item Description", Itm.Description);
                    Validate("Unit Price", Itm."Unit Price");

                end;
                BillingLine.Reset();
                BillingLine.SetRange("Document No", "Document No");
                if BillingLine.FindSet() then begin
                    repeat
                        if BillingLine."Item No" = "Item No" then
                            Error('Item %1 Already Exist', "Item No");
                    until BillingLine.Next() = 0;

                end;
            end;




        }
        field(3; "Item Description"; Text[200])
        {
            Caption = 'Item Description';
        }
        field(4; Qty; Integer)
        {
            Caption = 'Qty';
            trigger OnValidate()
            begin
                "Line Total" := Qty * "Unit Price";
                "Amount After Tax" := "Line Total" + 0.13 * "Line Total";
            end;
        }
        field(5; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
        }
        field(6; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
            Editable = false;
        }
        field(7; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
            Editable = false;
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
