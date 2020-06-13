using Financeira.Gestores;
using Financeira.Interfaces;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace Financeira.CrossCuting
{
    public class CrossCutingIoc
    {
        private IServiceCollection _services { get; set; }
        private IServiceProvider _provider { get; set; }

        public CrossCutingIoc()
        {
            _services = new ServiceCollection();
            RegisterServices();
        }
        public void RegisterServices()
        {
            _services.AddSingleton<ITiposCreditos, FinanciamentoAvaliacao>();
            //_services.AddSingleton<>();

            _provider = _services.BuildServiceProvider();
        }

        public T GetService<T>()
        {
            return (T)_provider.GetService(typeof(T));
        }
    }
}