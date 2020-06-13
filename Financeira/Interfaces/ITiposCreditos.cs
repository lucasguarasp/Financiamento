using System;
using System.Collections.Generic;
using System.Text;

namespace Financeira.Interfaces
{
    public interface ITiposCreditos
    {
        double CreditoDireto(double valor
            /*Taxa de 2% ao mês*/);

        double CreditoConsignado(double valor
            /*Taxa de 1% ao mês*/);

        double CreditoPessoaJuridica(double valor
            /*Taxa de 5% ao mês*/);

        double CreditoPessoaFisica(double valor
            /*Taxa de 3% ao mês*/);

        double CreditoImobiliario(double valor
            /*Taxa de 9% ao ano*/);
               
    }
}
