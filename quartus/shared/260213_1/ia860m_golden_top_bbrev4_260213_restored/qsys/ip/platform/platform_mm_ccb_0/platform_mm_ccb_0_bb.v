module platform_mm_ccb_0 #(
		parameter DATA_WIDTH          = 256,
		parameter SYMBOL_WIDTH        = 8,
		parameter HDL_ADDR_WIDTH      = 64,
		parameter BURSTCOUNT_WIDTH    = 5,
		parameter COMMAND_FIFO_DEPTH  = 64,
		parameter RESPONSE_FIFO_DEPTH = 64,
		parameter MASTER_SYNC_DEPTH   = 3,
		parameter SLAVE_SYNC_DEPTH    = 3,
		parameter SYNC_RESET          = 0
	) (
		input  wire                        m0_clk,                //   m0_clk.clk,                Clock input
		input  wire                        m0_reset,              // m0_reset.reset,              Reset input
		input  wire                        s0_clk,                //   s0_clk.clk,                Clock input
		input  wire                        s0_reset,              // s0_reset.reset,              Reset input
		output wire                        s0_waitrequest,        //       s0.waitrequest,        Wait request to Avalon Memory Mapped Host, indicates agent is not ready
		output wire [DATA_WIDTH-1:0]       s0_readdata,           //         .readdata,           Read Data output from Avalon Memory Mapped Agent
		output wire                        s0_readdatavalid,      //         .readdatavalid,      Valid read data indication from Avalon Memory Mapped Agent
		input  wire [BURSTCOUNT_WIDTH-1:0] s0_burstcount,         //         .burstcount,         Indicates number of burst transfers in each burst
		input  wire [DATA_WIDTH-1:0]       s0_writedata,          //         .writedata,          Write Data from Avalon Memory Mapped Host
		input  wire [HDL_ADDR_WIDTH-1:0]   s0_address,            //         .address,            Address output from Avalon Memory Mapped Host
		input  wire                        s0_write,              //         .write,              Write command from Avalon Memory Mapped Host
		input  wire                        s0_read,               //         .read,               Read command from Avalon Memory Mapped Host
		input  wire [31:0]                 s0_byteenable,         //         .byteenable,         Indicates valid read/write data location
		input  wire                        s0_debugaccess,        //         .debugaccess
		output wire [1:0]                  s0_response,           //         .response,           Indicates Read/Write Response from Avalon Memory Mapped Agent
		output wire [0:0]                  s0_writeresponsevalid, //         .writeresponsevalid, Valid write response indication from Avalon Memory Mapped Agent
		input  wire                        m0_waitrequest,        //       m0.waitrequest,        Wait request from Avalon Memory Mapped Agent, indicates agent is not ready
		input  wire [DATA_WIDTH-1:0]       m0_readdata,           //         .readdata,           Read Data input to Avalon Memory Mapped Host
		input  wire                        m0_readdatavalid,      //         .readdatavalid,      Valid read data indication from Avalon Memory Mapped Agent
		output wire [BURSTCOUNT_WIDTH-1:0] m0_burstcount,         //         .burstcount,         Indicates number of burst transfers in each burst
		output wire [DATA_WIDTH-1:0]       m0_writedata,          //         .writedata,          Write Data from Avalon Memory Mapped Host
		output wire [HDL_ADDR_WIDTH-1:0]   m0_address,            //         .address,            Address output from Avalon Memory Mapped Host
		output wire                        m0_write,              //         .write,              Write command from Avalon Memory Mapped Host
		output wire                        m0_read,               //         .read,               Read command from Avalon Memory Mapped Host
		output wire [31:0]                 m0_byteenable,         //         .byteenable,         Indicates valid read/write data location
		output wire                        m0_debugaccess,        //         .debugaccess
		input  wire [1:0]                  m0_response,           //         .response,           Indicates Read/Write Response from Avalon Memory Mapped Agent
		input  wire [0:0]                  m0_writeresponsevalid  //         .writeresponsevalid, Valid write response indication from Avalon Memory Mapped Agent
	);
endmodule

