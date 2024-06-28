using System.ComponentModel.DataAnnotations;

namespace PamadroBlazor.Models
{
    public class TimerParameters
    {
        [Required(ErrorMessage = "Please input Work Time")]
        public int WorkTimeMin { get; set; } = 50;
        public int ShortBreakTimeMin { get; set; } = 10;
        public int LongBreakTimeMin { get; set; } = 20; // reserved for future use
        public string TaskName { get; set; } = "Hellow World";
        public bool PlaySound { get; set; } = true;
        public bool ShowNotification { get; set; } = true;
    }
}
