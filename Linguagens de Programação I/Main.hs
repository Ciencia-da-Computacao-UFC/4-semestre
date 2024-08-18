import Data.Char
import Data.Int
import Data.Map (Map)
import Data.Set (Set)


-- Main do parser
-- main::IO ()
-- main = do
--   let parser = parserProg [Program, Id "foo", Semicolon, While, Id "a", EOP "+", IntegerToken 3, COP "<", Id "b", Do, Id "b", Assign, Id "b", EOP "+", IntegerToken 1, End]

-- syntax tree
data Token
  = Program
  | Semicolon
  | Begin
  | End
  | IntegerToken Integer
  | Id String
  | Assign
  | OpenBracket
  | CloseBracket
  | If
  | Then
  | Else
  | While
  | Do
  | Write
  | Read
  | EOP String
  | COP String
  | TOP String
  deriving (Eq,Show)

-- types of ast
newtype AstInteger = AstInteger Integer deriving (Show)
newtype AstId = AstId String deriving (Show)

-- Data, table 3.3
--1
data AstProg = Prog AstId AstStat deriving (Show)
--2
data AstStat = AstSemicolon AstStat AstStat 
              | AstAssign AstId AstExpr 
              | AstIf AstExpr AstStat AstStat 
              | AstWhile AstExpr AstStat 
              | AstRead AstId 
              | AstWrite AstExpr
              deriving (Show)

--3
data AstExpr = Identifier AstId 
              | AstInt AstInteger 
              | Op AstOp AstExpr AstExpr 
              | AstComp AstCop AstExpr AstExpr
              deriving (Show)
--4
data AstOp = Plus
            | Minus
            | Multiply
            | Divide
            deriving (Show)
--5
data AstCop = Equal
            | NotEqual
            | GreatherThan
            | LessThan
            | GreatherOrEqual
            | LessOrEqual
            deriving (Show)

-- Parser
parserProg :: [Token] -> ([Token], AstProg)
parserProg xs = case head xs of
  Program ->
    let statA = tail xs
     in let (tokens, idToken) = funcParserId statA
         in case head tokens of
              Semicolon ->
                let statB = tail tokens
                 in let (tokens, statTree) = parseStatement statB
                     in case head tokens of
                          End -> (tail tokens, Prog idToken statTree)


parseStatement :: [Token] -> ([Token], AstStat)
parseStatement ((Id str) : xs) =
  case head xs of
    Assign ->
      let (t, expr) = funcParseExpr (tail xs)
        in (t, AstAssign (AstId str) expr)
    
parseStatement (Begin : xs) = parseSequenceStat xs parseStatement funcSEP
parseStatement (If : xs) =
  let (t, parsedC) = funcParseComp xs
    in case head t of
        Then ->
          let (tt, x1) = parseStatement (tail t)
            in case head tt of
                Else ->
                  let (t3, x2) = parseStatement (tail tt)
                    in (t3, AstIf parsedC x1 x2)
     
parseStatement (While : xs) =
  let (t, c) = funcParseComp xs
    in case head t of
        Do ->
          let (tt, x) = parseStatement (tail t)
            in (tt, AstWhile c x)
        
parseStatement (Read : xs) = let (t, readIdentifier) = funcParserId xs in (t, AstRead readIdentifier)
parseStatement (write : xs) = let (t, expr) = funcParseExpr xs in (t, AstWrite expr)


funcSEP :: Token -> Bool
funcSEP Semicolon = True
funcSEP _ = False

funcEOP :: Token -> Bool
funcEOP (EOP _) = True
funcEOP x = False

funcTOP :: Token -> Bool
funcTOP (TOP _) = True
funcTOP _ = False

funcCOP :: Token -> Bool
funcCOP (COP _) = True
funcCOP _ = False

funcParseComp :: [Token] -> ([Token], AstExpr)
funcParseComp xs = parseSequenceExpr xs funcParseExpr funcCOP

funcParseExpr :: [Token] -> ([Token], AstExpr)
funcParseExpr xs = parseSequenceExpr xs funcParseTerm funcEOP

funcParseTerm :: [Token] -> ([Token], AstExpr)
funcParseTerm xs = parseSequenceExpr xs funParseFact funcTOP

parseSequenceStat :: [Token] -> ([Token] -> ([Token], AstStat)) -> (Token -> Bool) -> ([Token], AstStat)
parseSequenceStat xs nonTerm sep =
  let (t, statTree) = nonTerm xs
   in if sep (head t)
        then
          let x = head t
              (x2, _statTree) = parseSequenceStat (tail t) nonTerm sep
           in case x of
                Semicolon -> (x2, AstSemicolon statTree _statTree)
                
        else (t, statTree)

parseSequenceExpr :: [Token] -> ([Token] -> ([Token], AstExpr)) -> (Token -> Bool) -> ([Token], AstExpr)
parseSequenceExpr xs nonTerm sep =
  let (t, statTree) = nonTerm xs
   in if sep (head t)
        then
          ( let h = head t
                (tt, _statTree) = parseSequenceExpr (tail t) nonTerm sep
             in case h of
                  (EOP "+") -> (tt, Op Plus statTree _statTree)
                  (EOP "-") -> (tt, Op Minus statTree _statTree)
                  (TOP "*") -> (tt, Op Multiply statTree _statTree)
                  (TOP "/") -> (tt, Op Divide statTree _statTree)
                  (COP "==") -> (tt, AstComp Equal statTree _statTree)
                  (COP "!=") -> (tt, AstComp NotEqual statTree _statTree)
                  (COP ">") -> (tt, AstComp GreatherThan statTree _statTree)
                  (COP "<") -> (tt, AstComp LessThan statTree _statTree)
                  (COP "=<") -> (tt, AstComp LessOrEqual statTree _statTree)
                  (COP ">=") -> (tt, AstComp GreatherOrEqual statTree _statTree)
          )
        else (t, statTree)

funParseFact :: [Token] -> ([Token], AstExpr)
funParseFact xs = case head xs of
  (IntegerToken i) -> (tail xs, AstInt (AstInteger i))
  (Id str) -> (tail xs, Identifier (AstId str))
  OpenBracket ->
    let statA = tail xs
     in let (t, d) = funcParseExpr statA
         in case head t of
              CloseBracket -> (tail t, d)

funcParserAtom :: Token -> Bool
funcParserAtom (Id _) = True
funcParserAtom _ = False

funcParserIdent :: Token -> Bool
funcParserIdent OpenBracket = False
funcParserIdent CloseBracket = False
funcParserIdent t = funcParserAtom t

funcParserTokenIdToAstId :: Token -> AstId
funcParserTokenIdToAstId (Id str) = AstId str

funcParserId :: [Token] -> ([Token], AstId)
funcParserId xs =
  let th = head xs
   in case th of
        Id str -> (tail xs, AstId str)


-- Funções auxiliares criadas para fazer um tokenizer
-- funHelper :: String -> Bool
-- funHelper str = case dropwhile selected str of 
-- s -> True
-- _ -> False


-- parseToken::[String] > [Token]
-- parseToken xs = [tokenizer x|x <- xs]