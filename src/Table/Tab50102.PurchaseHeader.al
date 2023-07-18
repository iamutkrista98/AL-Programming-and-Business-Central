table 50102 PurchaseHeader
{
    Caption = 'PurchaseHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

            trigger OnValidate()
            var
                SalesManagement: Record "Sales & Receivables Setup";
                NoSerMgt: Codeunit NoSeriesManagement;
            begin
                if Rec."No." <> xRec."No." then begin
                    SalesManagement.Get();
                    SalesManagement.TestField(SalesManagement.purchasenoseries);
                    NoSerMgt.SetSeries("No.");

                end;



            end;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(3; "User ID"; Text[100])
        {
            Caption = 'User ID';
        }
        field(4; "Buy From Vendor"; Code[20])
        {
            Caption = 'Buy From Vendor';
            TableRelation = Vendor;
            trigger OnValidate()
            var
                ven: Record Vendor;
            begin
                if ven.Get("Buy From Vendor") then begin
                    Validate("Vendor Name", ven.Name);
                    Validate(Address, ven.Address);
                end;

            end;

        }
        field(12; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
        }
        field(5; Address; Text[200])
        {
            Caption = 'Address';
        }
        field(6; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum(PurchaseLine."Line Total" where("Document No." = field("No.")));
        }
        field(27; "Received By"; Code[20])
        {
            Caption = 'Received By';
        }
        field(99; "Amount After Tax"; Decimal)
        {
            Caption = 'Amount After Tax';
            FieldClass = FlowField;
            CalcFormula = sum(PurchaseLine."Amount After Tax" where("Document No." = field("No.")));

        }
        field(100; "purchnos"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSerMgt: Codeunit NoSeriesManagement;
        PurchLine: Record PurchaseLine;
    begin
        If "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup."purchasenoseries");
            Clear(NoSerMgt);
            NoSerMgt.InitSeries(SalesSetup."purchasenoseries", xRec."purchnos", 0D, "No.", Rec."purchnos");
        end;
        "Posting Date" := Today;
        "User ID" := UserId;
        PurchLine.SetRange("Document No.", "No.");
        PurchLine.Reset();
        if PurchLine.FindSet() then
            repeat
                PurchLine."Buy From Vendor" := "Buy From Vendor";
                PurchLine.Modify(true);
            until PurchLine.Next() = 0;
    end;

    trigger OnModify()
    var
        PurchLine: Record PurchaseLine;
    begin
        if Rec."Buy From Vendor" <> xRec."Buy From Vendor" then
            PurchLine.Delete(true);
        PurchLine.SetRange("Document No.", "No.");
        PurchLine.Reset();
        if PurchLine.FindSet() then
            repeat
                PurchLine."Buy From Vendor" := "Buy From Vendor";
                PurchLine.Modify(true);
            until PurchLine.Next() = 0;

    end;

}
