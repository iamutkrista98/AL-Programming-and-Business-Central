table 50105 "Billing Header"
{
    Caption = 'Billing Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            trigger OnValidate()
            var
                SalesSetup: Record "Sales & Receivables Setup";
                NoSerMgt: Codeunit NoSeriesManagement;
            begin
                if Rec."No." <> xRec."No." then begin
                    SalesSetup.Get();
                    SalesSetup.TestField(SalesSetup."billnos");
                    NoSerMgt.SetSeries("No.");
                end;
            end;
        }
        field(2; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Customer,Employee;
        }
        field(5; "Sell to Customer"; Code[20])
        {
            Caption = 'Sell to Customer';
            TableRelation = if (Type = const(Customer)) Customer
            else
            if (Type = const(Employee)) Employee;

            trigger OnValidate()
            var
                Cus: Record Customer;
                Emp: Record Employee;
            begin
                TestField(Type);
                if (Type = Type::Customer) then begin
                    Cus.Reset();
                    Cus.SetRange("No.", "Sell to Customer");
                    if Cus.FindFirst() then
                        Address := Cus.Address;
                    "Customer Name" := Cus.Name;
                end
                else
                    if (Type = Type::Employee) then begin
                        Emp.Reset();
                        Emp.SetRange("No.", "Sell to Customer");
                        if Emp.FindFirst() then
                            Address := Emp.Address;
                        "Customer Name" := Emp."First Name";
                    end else begin
                        Address := ' ';
                        "Customer Name" := ' ';

                    end;

            end;



        }
        field(6; "User ID"; Code[30])
        {
            Caption = 'User ID';
        }
        field(7; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
            FieldClass = FlowField;
            CalcFormula = sum("Billing Line"."Line Total" where("Document No" = field("No.")));
            Editable = false;

        }
        field(8; "billno"; Code[20])
        {


        }
        field(9; "Customer Name"; Text[100])
        {

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSerMgt: Codeunit NoSeriesManagement;
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField(SalesSetup.billnos);
            Clear(NoSerMgt);
            NoSerMgt.InitSeries(SalesSetup.billnos, xRec.billno, 0D, "No.", Rec.billno);
        end;
        "Posting Date" := Today;
        "User ID" := UserId;

    end;
}
