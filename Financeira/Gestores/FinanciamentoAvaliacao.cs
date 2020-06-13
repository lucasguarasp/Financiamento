using Financeira.Entidades;
using Financeira.Interfaces;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using static Financeira.Entidades.Credito;

namespace Financeira.Gestores
{
    public class FinanciamentoAvaliacao : ITiposCreditos
    {
        //ITiposCreditos _tiposCreditos;
        public FinanciamentoAvaliacao()
        {
            //_tiposCreditos = tiposCreditos;
        }
        public void Avaliacao(Credito credito)
        {
            double ValortotalComJuros = 0.0;
            double ValorJuros = 0.0;

            if (credito.isValid())
            {
                switch (credito.TipoCredito)
                {
                    case TiposCredito.CreditoDireto:
                        ValortotalComJuros = CreditoDireto(credito.ValorCredito);
                        break;
                    case TiposCredito.CreditoConsignado:
                        ValortotalComJuros = CreditoConsignado(credito.ValorCredito);
                        break;
                    case TiposCredito.CreditoPessoaJuridica:
                        ValortotalComJuros = CreditoPessoaJuridica(credito.ValorCredito);
                        break;
                    case TiposCredito.CreditoPessoaFisica:
                        ValortotalComJuros = CreditoPessoaFisica(credito.ValorCredito);
                        break;
                    case TiposCredito.CreditoImobiliario:
                        ValortotalComJuros = CreditoImobiliario(credito.ValorCredito);
                        break;
                    default:
                        break;
                }

                ValorJuros = ValortotalComJuros - credito.ValorCredito;
                Console.WriteLine("Status do crédito: Aprovado");
                Console.WriteLine($"Valor total com juros " + ValortotalComJuros.ToString("C2", CultureInfo.CurrentCulture));
                Console.WriteLine($"Valor do juros " + ValorJuros.ToString("C2", CultureInfo.CurrentCulture));
            }

        }

        #region TIPOS  DE CREDITOS

        public double CreditoConsignado(double valor)
        {
            return (valor * 102 / 100);
        }

        public double CreditoDireto(double valor)
        {
            return (valor * 101 / 100);
        }

        public double CreditoImobiliario(double valor)
        {
            return (valor * 105 / 100);
        }

        public double CreditoPessoaFisica(double valor)
        {
            return (valor * 103 / 100);
        }

        public double CreditoPessoaJuridica(double valor)
        {
            return (valor * 109 / 100);
        }
        #endregion
    }


}
