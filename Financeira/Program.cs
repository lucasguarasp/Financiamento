using Financeira.CrossCuting;
using Financeira.Entidades;
using Financeira.Gestores;
using Financeira.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using System;
using static Financeira.Entidades.Credito;

namespace Financeira
{
    class Program
    {
        static void Main(string[] args)
        {
            //CrossCutingIoc crossCuting = new CrossCutingIoc();
            //var servicos = crossCuting.GetService<ITiposCreditos>();

            try
            {
                Credito credito = new Credito()
                {
                    ValorCredito = 10000,
                    TipoCredito = TiposCredito.CreditoPessoaJuridica,
                    QuantidadeParcelas = 55,
                    DataPrimeiroVencimento = DateTime.Now.AddDays(16)
                };


                FinanciamentoAvaliacao financiamentoAvaliacao = new FinanciamentoAvaliacao();
                financiamentoAvaliacao.Avaliacao(credito);

            }
            catch (Exception e)
            {
                Console.WriteLine("Status do crédito: Recusado");
                Console.WriteLine(e.Message);
            }
            
            Console.ReadKey();
        }



    }
}
