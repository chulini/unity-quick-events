# Unity Quick Events

This is a script in written ruby that helps to make event systems in C# Unity quickly. 

###How to use:

Clone or download the repository, open the directory in the terminal and write:

`$ ruby unity-quick-events.rb "YourNameEvent(your arguments)"`


For example:

`$ ruby unity-quick-events.rb "ShowPreferences(float currentVolume, bool musicOn, Color bgColor)"`


Then the script will show you how to declare, trigger and subsribe to the event.
In this case:
```
---- To declare event, in your EventsManager.cs ----

public delegate void ShowPreferencesDelegate(float currentVolume, bool musicOn, Color bgColor);
public static event ShowPreferencesDelegate ShowPreferencesEvent;
public static void ShowPreferences(float currentVolume, bool musicOn, Color bgColor){
	if(ShowPreferencesEvent != null)
		ShowPreferencesEvent(currentVolume,musicOn,bgColor);
}




---- To trigger event, from any class ----

EventsManager.ShowPreferences(currentVolume,musicOn,bgColor);




---- To subscribe to event, from any MonoBehaviour class ----

void OnEnable(){
	EventsManager.ShowPreferencesEvent += ShowPreferencesEvent;
}
void OnDisable(){
	EventsManager.ShowPreferencesEvent -= ShowPreferencesEvent;
}
void ShowPreferencesEvent(float currentVolume, bool musicOn, Color bgColor){
	//CODE HERE
}

```

You just have to copy and paste into your C# unity.