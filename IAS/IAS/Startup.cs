using IAS;
using Microsoft.AspNetCore.Cors;
using Microsoft.Owin;
using Owin;
using System;
using System.Threading.Tasks;


[assembly: OwinStartup(typeof(Startup), "Configuration")]
namespace IAS
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
        }
    }
}
