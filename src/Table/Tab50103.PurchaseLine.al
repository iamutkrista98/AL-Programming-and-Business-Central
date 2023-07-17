table 50103 PurchaseLine
{
    Caption = 'PurchaseLine';
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
            TableRelation = Item where("Vendor No." = field("Buy From Vendor"));
            trigger OnValidate()
            var
                Itm: Record Item;
                BillLine: Record PurchaseLine;
            begin
                if Itm.Get("Item No.") then begin
                    Validate("Unit Price", Itm."Unit Price");
                    Validate("Item Name", Itm.Description);

                end;
                BillLine.Reset();
                BillLine.SetRange("Document No.", Rec."Document No.");
                if BillLine.FindSet() then
                    repeat
                        if BillLine."Item No." = "Item No." then
                            Error('Item No Already Exist', "Item No.");
                    until BillLine.Next() = 0;
            end;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; Qty; Integer)
        {
            Caption = 'Qty';
            trigger OnValidate()
            begin
                Validate("Line Total", Qty * "Unit Price");
                Validate("Amount After Tax", "Line Total" + 0.13 * "Line Total");

            end;
        }
        field(5; "Unit Price"; Integer)
        {
            Caption = 'Unit Price';
            Editable = false;
        }
        field(6; "Line Total"; Decimal)
        {
            Caption = 'Line Total';
        }
        field(7; "Item Name"; Text[200])
        {
            Caption = 'Item Name';
            Editable = false;
        }
        field(21; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
        }
        field(22; "Buy From Vendor"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        purchhead: Record "PurchaseHeader";
    begin
        if purchhead.Get("Document No.") then
            "Buy From Vendor" := purchhead."Buy From Vendor";
    end;
}
