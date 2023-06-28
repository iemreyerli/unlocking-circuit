`timescale 1ns / 1ps



module kilit_acici(
input [2:0] sag_adim, [1:0] sol_adim, [5:0] kilit_sifre,
output kilit_acik
    );
 wire sag2n,sag1n,sag0n,sol1n,sol0n;
 not(sag2n,sag_adim[2]);
 not(sag1n,sag_adim[1]);
 not(sag0n,sag_adim[0]);
 not(sol1n,sol_adim[1]);
 not(sol0n,sol_adim[0]);

wire [40:0] w; 
wire [5:0] x;
 
and(w[0],sag2n,sag1n,sag_adim[0],sol1n,sol_adim[0]);
and(w[1],sag2n,sag_adim[1],sag_adim[0],sol_adim[1],sol0n);
and(w[2],sag_adim[2],sag_adim[1],sag_adim[0],sol1n,sol0n);
and(w[3],sag_adim[2],sag1n,sag_adim[0],sol_adim[1],sol_adim[0]);

or(x[5],w[0],w[1],w[2],w[3]);

and(w[4],sag2n,sag1n,sag0n,sol1n,sol_adim[0]);
and(w[5],sag2n,sag1n,sol_adim[1],sol0n);
and(w[6],sag2n,sag_adim[1],sol_adim[1],sol_adim[0]);
and(w[7],sag2n,sag0n,sol_adim[1],sol_adim[0]);
and(w[8],sag_adim[2],sag1n,sag0n,sol_adim[1],sol_adim[0]);
and(w[9],sag_adim[2],sag1n,sol1n,sol0n);
and(w[10],sag_adim[2],sag_adim[1],sol1n,sag0n);
and(w[11],sag_adim[2],sol1n,sag_adim[1],sol_adim[0]);

or(x[4],w[4],w[5],w[6],w[7],w[8],w[9],w[10],w[11]);



and(w[12],sag2n,sag_adim[1],sol1n,sol0n);
and(w[13],sag2n,sag1n,sag0n,sol_adim[0]);
and(w[14],sag2n,sag_adim[0],sol_adim[1],sol_adim[0]);
and(w[15],sag2n,sag1n,sol_adim[1],sag_adim[0]);
and(w[16],sag2n,sag_adim[1],sag0n,sol_adim[1],sol0n);
and(w[17],sag_adim[2],sag_adim[1],sag0n,sol1n,sol_adim[0]);
and(w[18],sag_adim[2],sag_adim[1],sol_adim[1],sol0n);
and(w[19],sag_adim[2],sag_adim[0],sol1n,sol_adim[0]);
and(w[20],sag_adim[2],sol1n,sag1n,sag_adim[0]);
and(w[21],sag_adim[2],sol1n,sol_adim[0],sag1n);

or(x[3],w[12],w[13],w[14],w[15],w[16],w[17],w[18],w[19],w[20],w[21]);


and(w[22],sag2n,sag_adim[1],sag0n,sol_adim[1]);
and(w[23],sag2n,sag_adim[1],sag_adim[0],sol1n);
and(w[24],sag2n,sag1n,sag_adim[0],sol0n,sol1n);
and(w[25],sag2n,sag1n,sag_adim[0],sol_adim[1],sol_adim[0]);
and(w[26],sag2n,sag1n,sag0n,sol1n,sol_adim[0]);
and(w[27],sag2n,sag1n,sag0n,sol_adim[1],sol0n);
and(w[28],sag_adim[2],sag_adim[1],sag0n,sol0n);
and(w[29],sag_adim[2],sag_adim[1],sag_adim[0],sol1n);
and(w[30],sag_adim[2],sag1n,sag_adim[0],sol_adim[1],sol0n);
and(w[31],sag_adim[2],sag1n,sag_adim[0],sol1n,sol_adim[0]);
and(w[32],sag_adim[2],sag1n,sag0n,sol1n,sol0n);
and(w[33],sag_adim[2],sag1n,sag0n,sol_adim[1],sol_adim[0]);
 
or(x[2],w[22],w[23],w[24],w[25],w[26],w[27],w[28],w[29],w[30],w[31],w[32],w[33]);



and(w[34],sag2n,sag1n,sol_adim[0]);
and(w[35],sag2n,sag_adim[1],sol0n);
and(w[36],sag_adim[2],sag1n,sol_adim[0]);
and(w[37],sag_adim[2],sag_adim[1],sol0n);

or(x[1],w[34],w[35],w[36],w[37]);


and(w[38],sag2n,sag_adim[0]);
and(w[39],sag_adim[2],sag_adim[0]);

or(x[0],w[38],w[39]);
 
wire[5:0] k;
xnor(k[5],x[5],kilit_sifre[5]); 
xnor(k[4],x[4],kilit_sifre[4]); 
xnor(k[3],x[3],kilit_sifre[3]);
xnor(k[2],x[2],kilit_sifre[2]); 
xnor(k[1],x[1],kilit_sifre[1]);
xnor(k[0],x[0],kilit_sifre[0]);   

and(kilit_acik,k[5],k[4],k[3],k[2],k[1],k[0]);

endmodule
