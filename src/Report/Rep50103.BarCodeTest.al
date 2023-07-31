report 50103 BarCodeTest
{
    ApplicationArea = All;
    Caption = 'BarCodeTest';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'src\BarcodeTest.rdl';

    dataset
    {
        dataitem(Item; "Item")
        {
            column(No_; "No.")
            {

            }
            column(Description; Description)
            {

            }
            column(EncodeStr; EncodeStr)
            {

            }


            trigger OnAfterGetRecord()
            var
                BarcodeString: Text;
                BarcodeSymbology: Enum "Barcode Symbology";
                BarcodeFontProvider: Interface "Barcode Font Provider";

            begin
                // Declare the barcode provider using the barcode provider interface and enum
                BarcodeFontProvider := Enum::"Barcode Font Provider"::IDAutomation1D;

                // Declare the font using the barcode symbology enum
                BarcodeSymbology := Enum::"Barcode Symbology"::"Code39";

                // Set data string source 
                BarcodeString := "No.";

                // Validate the input. This method is not available for 2D provider
                BarcodeFontProvider.ValidateInput(BarcodeString, BarcodeSymbology);

                // Encode the data string to the barcode font
                EncodeStr := BarcodeFontProvider.EncodeFont(BarcodeString, BarcodeSymbology);
            end;


        }
    }

    var
        EncodeStr: Text;

}

