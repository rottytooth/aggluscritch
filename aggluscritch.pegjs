Word = t:ThereIsA+
{
	return t.join(";\n") + ";";
}
   
ThereIsA = ('Sc'/'sc'/'Th'/'th'/'T'/'t') 'ri' d:(SingleType / ListType) c:Command? _?
{
	if (!c)
    	return d;
    else
		return c + "(" + d + ")";
}

SingleType = t:(Int / Char) Number

ListType = t:(StringChars / List / Dict) n:Number+ "'tah"
{
	
	if (t == "string_from_chars") {
    	return '"' + String.fromCharCode.apply(this, n) + '"';
    }
	return {"t": t, "n": n};
} / String s:[^']* "'mah" { return '"' + s.join("") + '"'; }

Int = "k" { return "int"; }
Char = "th" { return "char"; }

String = "tch" { return "string"; }
StringChars = "x" { return "string_from_chars"; }
List = "p" { return "list"; }
Dict = "v" { return "dict"; }

Number = d:(Zero / One / Two / Three / Four / Five)+ "'kah"
{
	return parseInt(d.join(""), 6);
}

Zero = "or" { return 0; }
One = "aht" { return 1; }
Two = "ahn" { return 2; }
Three = "eer" { return 3; }
Four = "eet" { return 4; }
Five = "een" { return 5; }

Command = "tu" p:(Print/Assign)
{
	return p;
}

Assign = "bu" _ Identifier 
{
	return "assign";
}

Identifier = Consonant Vowel Consonant?

Consonant = ("th"/"t"/"g"/"h"/"sh"/"y"/"z"/"x"/"w"/"v"/"j"/"dz") 

Vowel = ("a"/"e"/"i"/"o"/"u")

Print = "li" 
{
	return "print";
}

_ "whitespace" = [ \t\n\r]+
