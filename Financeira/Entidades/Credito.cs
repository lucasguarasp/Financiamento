using System;
using System.Collections.Generic;
using System.Text;

namespace Financeira.Entidades
{
    public class Credito
    {
        public double ValorCredito { get; set; }
        public TiposCredito TipoCredito { get; set; }
        public int QuantidadeParcelas { get; set; }
        public DateTime DataPrimeiroVencimento { get; set; }
        
        public enum TiposCredito
        {
            CreditoDireto = 1,
            CreditoConsignado = 2,
            CreditoPessoaJuridica = 3,
            CreditoPessoaFisica = 4,
            CreditoImobiliario = 5
        }

        public bool isValid()
        {
            if (ValorCredito > 1000000)
                throw new InvalidOperationException("O valor máximo a ser liberado para qualquer tipo de empréstimo é de R$ 1.000.000,00");

            if (QuantidadeParcelas > 72)
                throw new InvalidOperationException("A quantidade de parcelas máximas é de 72x");

            if (QuantidadeParcelas < 5)
                throw new InvalidOperationException("A quantidade de parcelas mínima é de 5x");

            if (TipoCredito == TiposCredito.CreditoPessoaJuridica && ValorCredito < 15000)
                throw new InvalidOperationException("Para o crédito de pessoa jurídica, o valor mínimo a ser liberado é de R$ 15.000,00");

            if (DataPrimeiroVencimento < (DateTime.Now.AddDays(15)) || DataPrimeiroVencimento > (DateTime.Now.AddDays(40)))
                throw new InvalidOperationException("A data do primeiro vencimento sempre será no mínimo D+15(Dia atual + 15 dias), e no máximo, D + 40(Dia atual + 40 dias)");
            
            return true;
        }

    }


}
