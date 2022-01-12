object Q7 {
    def main(args: Array[String]) {  
        var a:Char=0;
    
        print("Enter character: ")  
        a=scala.io.StdIn.readChar()
        
        a match{
            case 'A'=>printf("%c is a VOWEL.\n",a);
            case 'E'=>printf("%c is a VOWEL.\n",a);
            case 'I'=>printf("%c is a VOWEL.\n",a);
            case 'O'=>printf("%c is a VOWEL.\n",a);
            case 'U'=>printf("%c is a VOWEL.\n",a);
            case 'a'=>printf("%c is a VOWEL.\n",a);
            case 'e'=>printf("%c is a VOWEL.\n",a);
            case 'i'=>printf("%c is a VOWEL.\n",a);
            case 'o'=>printf("%c is a VOWEL.\n",a);
            case 'u'=>printf("%c is a VOWEL.\n",a);
            case _=>printf("%c is a CONSONANT.\n",a);
        }  
    }
}  