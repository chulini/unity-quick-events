# puts ARGV[0]
f = ARGV[0].split('(')[0].split(' ')[0]
vars_declaration = ARGV[0].split('(')[1].split(')')[0]
var_names = ""
if vars_declaration != ""
	i = 0;
	for var in vars_declaration.split(',') do
		# puts "var[#{i}]=#{var}"
		var_names += var.split(' ')[-1]
		if i < (vars_declaration.split(',').length-1)
			var_names += ','
		end
		i+=1
	end
end

puts "---- IN EventsManager.cs ----"
puts "
public delegate void #{f}Delegate(#{vars_declaration});
public static event #{f}Delegate #{f}Event;
public static void #{f}(#{vars_declaration}){
	if(#{f}Event != null)
		#{f}Event(#{var_names});
}
"
puts "\n\n\n\n---- To trigger event ----"
puts "
EventsManager.#{f}(#{var_names});
"

puts "\n\n\n\n---- To subscribe to event ----"
puts "
void OnEnable(){
	EventsManager.#{f}Event += #{f}Event;
}
void OnDisable(){
	EventsManager.#{f}Event -= #{f}Event;
}
void #{f}Event(#{vars_declaration}){
	//CODE HERE
}
"

