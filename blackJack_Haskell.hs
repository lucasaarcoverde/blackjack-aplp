import System.Random as Random
import Control.Monad (replicateM)
import System.IO.Unsafe
import Control.Monad(when) 

baralho = zip ["As de copas", "As de espadas", "As de ouro", "As de paus", "Dois de copas","Dois de espadas", "Dois de ouro", "Dois de paus", "Tres de copas", "Tres de espadas", "Tres de ouro", "Tres de paus", "Quatro de copas", "Quatro de espadas", "Quatro de ouro", "Quatro de paus", "Cinco de copas", "Cinco de espadas", "Cinco de ouro", "Cinco de paus", "Seis de copas", "Seis de espadas", "Seis de ouro", "Seis de paus", "Sete de copas", "Sete de espadas", "Sete de ouro", "Sete de paus", "Oito de copas", "Oito de espadas", "Oito de ouro", "Oito de paus", "Nove de copas", "Nove de espadas", "Nove de ouro", "Nove de paus", "Dez de copas", "Dez de espadas", "Dez de ouro", "Dez de paus", "Valete de copas", "Valete de espadas", "Valete de ouro", "Valete de paus", "Dama de copas", "Dama de espadas", "Dama de ouro", "Dama de paus", "Rei de copas", "Rei de espadas", "Rei de ouro", "Rei de paus"] [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]

baralhoHumano = []

baralhoMaquina = []

--Main da aplicação
main :: IO ()
main = do
 escolherDificuldade

 opcaoInput <- getLine
 let opcao = read opcaoInput :: Int
 	
 if(opcao == 1) then putStrLn "Dificuldade escolhida é: Fácil"
  else if (opcao == 2) then putStrLn "Dificuldade escolhida é: Médio"
   else putStrLn "Dificuldade escolhida é: Difícil"
--linha 30
 iniciarPartida

--Escolher dificuldade do jogo
escolherDificuldade :: IO()
escolherDificuldade = do
 putStrLn "Bem vindo ao jogo 21!"
 putStrLn "Escolha a dificuldade da partida:"
 putStrLn "1 - Fácil"
 putStrLn "2 - Médio"
 putStrLn "3 - Difícil"

--Iniciar partida puxando as cartas
iniciarPartida :: IO()
iniciarPartida = do

-- Pega cartas do humano
   
   --pega primeira carta
   indice1 <- randomRIO(0 :: Int, 51 :: Int)
   let carta1 = baralho !! indice1
   let pontuacaoHumano1 = snd (carta1)

   --remove a carta do baralho
   let primeiraParte = take indice1 baralho
   let proximaCarta = indice1 + 1
   let segundaParte = drop proximaCarta baralho
   let novoBaralho = primeiraParte ++ segundaParte
   
   --pega segunda carta
   indice2 <- randomRIO(0 :: Int, 50 :: Int)
   let carta2 = novoBaralho !! indice2
   let pontuacaoHumano2 = pontuacaoHumano1 + snd (carta2)
   
   --remove a carta do baralho
   let primeiraParte = take indice2 novoBaralho
   let proximaCarta = indice2 + 1
   let segundaParte = drop proximaCarta novoBaralho
   let novoBaralho = primeiraParte ++ segundaParte

   --pega terceira carta
   indice3 <- randomRIO(0 :: Int, 49 :: Int)
   let carta3 = novoBaralho !! indice3
   let pontuacaoHumano3 = pontuacaoHumano2 + snd (carta3)

   --remove a carta do baralho
   let primeiraParte = take indice3 novoBaralho
   let proximaCarta = indice3 + 1
   let segundaParte = drop proximaCarta novoBaralho
   let novoBaralho = primeiraParte ++ segundaParte

   let cartas = [carta1, carta2, carta3]
   let novoBaralhoHumano = baralhoHumano ++ cartas
   putStrLn "Baralho Humano: "
   putStrLn((show novoBaralhoHumano) ++ " Pontuação: " ++ (show pontuacaoHumano3))
  

   
------------------------------------------------------
-- Pega cartas da maquina

   --pega primeira carta
   indice1 <- randomRIO(0 :: Int, 48 :: Int)
   let carta1 = novoBaralho !! indice1
   let pontuacaoMaquina1 = snd (carta1)
   
   --remove a carta do baralho
   let primeiraParte = take indice1 baralho
   let proximaCarta = indice1 + 1
   let segundaParte = drop proximaCarta baralho
   let novoBaralho = primeiraParte ++ segundaParte
   
   --pega segunda carta
   indice2 <- randomRIO(0 :: Int, 47 :: Int)
   let carta2 = novoBaralho !! indice2
   let pontuacaoMaquina2 = pontuacaoMaquina1 + snd (carta2)
  
   --remove a carta do baralho
   let primeiraParte = take indice2 novoBaralho
   let proximaCarta = indice2 + 1
   let segundaParte = drop proximaCarta novoBaralho
   let novoBaralho = primeiraParte ++ segundaParte

   --pega terceira carta
   indice3 <- randomRIO(0 :: Int, 46 :: Int)
   let carta3 = novoBaralho !! indice3
   let pontuacaoMaquina3 = pontuacaoMaquina2 + snd (carta3)
   
   --remove a carta do baralho
   let primeiraParte = take indice3 novoBaralho
   let proximaCarta = indice3 + 1
   let segundaParte = drop proximaCarta novoBaralho
   let novoBaralho = primeiraParte ++ segundaParte

   let cartas = [carta1, carta2, carta3]
   let novoBaralhoMaquina = baralhoMaquina ++ cartas
   putStrLn "Baralho Maquina: "
   putStrLn((show novoBaralhoMaquina) ++ " Pontuação: " ++ (show pontuacaoMaquina3))
   
