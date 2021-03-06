
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vLSC_CSR_TOTAL]

AS
SELECT lsc_csr_id,
	    ISNULL(A,0) + ISNULL(B,0) + ISNULL(C,0) + ISNULL(D,0) + ISNULL(E,0) + ISNULL(F,0) + 
		ISNULL(G,0) + ISNULL(H,0) + ISNULL(I,0) + ISNULL(Ia,0) + ISNULL(Ib,0) + ISNULL(Ic,0) + 
		ISNULL(J,0) + ISNULL(K,0) + ISNULL(L,0) total,
        
        ISNULL(F,0) + ISNULL(G,0) + ISNULL(H,0) + ISNULL(Ia,0) + ISNULL(Ib,0) + ISNULL(Ic,0) + 
		ISNULL(K,0) + ISNULL(L,0) extended_cases,

        ISNULL(A,0) + ISNULL(B,0) limited_cases,
   
        ISNULL(G,0) + ISNULL(H,0) + ISNULL(Ib,0) + ISNULL(Ic,0) contested_cases

   FROM LSC_CSR
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

