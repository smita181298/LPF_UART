module tx_test;
    reg i_Clock,i_Tx_DV;
    reg [7:0]i_Tx_Byte;
    wire o_Tx_Active,o_Tx_Serial,o_Tx_Done;
    wire o_Rx_DV;
    wire [7:0] o_Rx_Byte;
    wire [2:0]TX_SM_Main;
    parameter CLKS_PER_BIT=8'd87;
    uart_tx TX
    (i_Clock,i_Tx_DV,i_Tx_Byte,o_Tx_Active,o_Tx_Serial,o_Tx_Done);
    uart_rx R(i_Clock,o_Tx_Serial,o_Rx_DV,o_Rx_Byte);
    initial
        i_Clock=1'b1;
    always
        #5 i_Clock=~i_Clock;
    initial
    begin
        i_Tx_DV=0;i_Tx_Byte=8'd10;
        #100 i_Tx_DV=1;i_Tx_Byte=8'd45;
    end
endmodule
