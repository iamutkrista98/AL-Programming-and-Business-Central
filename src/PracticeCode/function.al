page 50139 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    layout
    {
        area(Content)
        {
            group(Inputs)
            {
                field(Number; Number)
                {
                    ApplicationArea = All;
                    ShowMandatory = true;
                    NotBlank = true;
                }

            }

            group(Output)
            {
                field(Factorial; Factorial)
                {
                    ApplicationArea = All;
                    Editable = false;

                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(setautocalc)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    cus."No." := '01454545';
                    cus.SetAutoCalcFields(Balance, "Net Change");
                    if (cus.Find('=') = true) then
                        repeat

                        until cus.Next() = 0;
                    Message('The balance is: %1', cus.Balance);
                end;
            }
            action(calcfields)
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    cus."No." := '01454545';

                    if (cus.Find('=') = true) then
                        repeat
                            cus.CalcFields(Balance, "Net Change");
                        until cus.Next() = 0;
                    Message('The balance is: %1', cus.Balance, cus.Name, cus.Address);
                end;

            }
            action(calcFactorial)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Fact := 1;
                    for I := 1 to Number do
                        Fact := Fact * I;
                    Factorial := Fact;
                    Message('The factorial for the number %1 is %2', Number, Fact);
                end;
            }
            action(CheckOddEven)
            {
                ApplicationArea = All;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Number MOD 2 = 0 then
                        Message('The number %1 is even', Number)
                    else
                        Message('The number %1 is odd', Number);


                end;
            }

            action("Procedure Passing Test")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SendConfirmation;

                trigger OnAction()
                var
                    num1: Integer;
                    num2: Integer;
                begin
                    num1 := 20;
                    num2 := TestProcedure(num2);
                    Message('num1 is %1', num1);
                    Message('num2 is %1', num2);

                end;

            }
        }

        area(Navigation)
        {
            group("Detail Information")
            {
                action("CustomerDetails")
                {
                    ApplicationArea = All;
                    Image = Info;
                    //make the action open the customer card page
                    RunObject = page "Customer Card";

                }

            }

        }
        area(Reporting)
        {
            action("Report")
            {
                ApplicationArea = All;
                Image = Report;
                RunObject = report "PracticeReport";
            }

        }
    }

    var
        myInt: Integer;
        cus: Record Customer;
        Number: Integer;
        Fact: Integer;
        I: Integer;
        Factorial: Integer;

    procedure TestProcedure(var num1: Integer): Integer
    begin
        num1 := 30;
        exit(num1);

    end;
}