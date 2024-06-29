using Microsoft.JSInterop;

namespace PamadroBlazor.Utils
{
    public class JsConsole
    {
        private readonly IJSRuntime JsRuntime;
        public JsConsole( IJSRuntime jSRuntime )
        {
            this.JsRuntime = jSRuntime;
        }

        public void Log( object message )
        {
            this.JsRuntime.InvokeVoidAsync( "console.log", message );
        }
        
        public async Task LogAsync( object message )
        {
            await this.JsRuntime.InvokeVoidAsync( "console.log", message );
        }
    }
}
