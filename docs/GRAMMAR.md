# Gramar

**Reference:** https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html

```
program           : linebreak complete_commands linebreak
                  | linebreak
                  ;

complete_commands : complete_commands new_list complete_command
                  |                            complete_command  
                  ;  

complete_command : list separator_op
                 | list
                 ;

list             : list separator_op and_or
                 |                   and_or
                 ;

and_or           :                         pipeline
                 | and_or AND_IF linebreak pipeline
                 | and_or OR_IF  linebreak pipeline
                 ;

pipeline         :      pipe_sequence
                 | Bang pipe_sequence
                 ;

pipe_sequence    :                             command
                 | pipe_sequence '|' linebreak command
                 ;

command          : simple_command
                 | /* compound_command */
                 | /* compound_command redirect_list */
                 | /* function_definition */
                 ;

simple_command   : cmd_prefix cmd_word cmd_suffix
                 | cmd_prefix cmd_word
                 | cmd_prefix
                 | cmd_name cmd_suffix
                 | cmd_name
                 ;

cmd_name         : WORD                   /* Apply rule 7a */
                 ;
cmd_word         : WORD                   /* Apply rule 7b */
                 ;
cmd_prefix       :            io_redirect
                 | cmd_prefix io_redirect
                 |            ASSIGNMENT_WORD
                 | cmd_prefix ASSIGNMENT_WORD
                 ;
cmd_suffix       :            io_redirect
                 | cmd_suffix io_redirect
                 |            WORD
                 | cmd_suffix WORD
                 ;

io_redirect      :             io_file
                 | IO_NUMBER   io_file
                 | IO_LOCATION io_file /* Optionally supported */
                 |             io_here
                 | IO_NUMBER   io_here
                 | IO_LOCATION io_here /* Optionally supported */
                 ;

io_file          : '<'       filename
                 | LESSAND   filename
                 | '>'       filename
                 | GREATAND  filename
                 | DGREAT    filename
                 | LESSGREAT filename
                 | CLOBBER   filename
                 ;

filename         : WORD                      /* Apply rule 2 */

                 ;
io_here          : DLESS     here_end
                 | DLESSDASH here_end
                 ;

here_end         : WORD                      /* Apply rule 3 */
                 ;

newline_list     :              NEWLINE
                 | newline_list NEWLINE
                 ;

linebreak        : newline_list
                 | /* empty */
                 ;

separator_op     : '&'
                 | ';'
                 ;

separator        : separator_op linebreak
                 | newline_list
                 ;

sequential_sep   : ';' linebreak
                 | newline_list
                 ;

```