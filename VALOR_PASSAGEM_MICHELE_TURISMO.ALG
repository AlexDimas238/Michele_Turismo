Algoritmo "Valor_Passagem_Michele_Turismo"
// Descrição   : Calcula o valor a ser cobrado em cada tipo de passeio
// Autor(a)    : Alexandre Dimas Santos Reis
// Data atual  : 23/10/2021
Var
// Seção de Declarações das variáveis 
x, viagem, onibus, lucro, kit, vguia, guialocal, nguia, diaria: inteiro
ticket, ticket1, ticket2, hotel, taxa: real

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...

kit <-5
lucro<-30

   repita
      escreval("--------------------------------------")
      escreval("MICHELE TURISMO - CALCULO DE PASSAGEM")
      escreval("--------------------------------------")
         escreval("")
         escreval(" 1 - Bate e Volta")
         escreval(" 2 - Excursão")
         escreva("Digite o número correspondente ao tipo de Viagem: ")

      repita
         leia(viagem)
      ate (viagem = 1) ou (viagem = 2)
      escreva("")
      escreva("Digite o valor do ônibus: ")
      leia(onibus)
      escreva("Numero de Guias da Michele: ")
      leia(nguia)
      escreva("Digite o valor total a ser pago por guia: ")
      leia(vguia)

      se viagem = 1 entao
         ticket1<-(kit+(nguia * vguia +onibus)/32)
         escreval()
         escreval("O Custo por passagem é: R$", ticket1)
         ticket1<- ticket1 + (ticket1 * lucro/100)
         escreval("O Valor a ser cobrado por passagem é: R$",ticket1)

         senao
              escreva("Digite o valor da taxa da cidade: ")
              leia(taxa)
              escreva("Digite o valor total do guia local: ")
              leia(guialocal)
              escreva("Digite o valor da Diária P/ Pessoa no Hotel: ")
              leia(hotel)
              escreva("Digite o número de diárias: ")
              leia(diaria)

              ticket2 <- kit+(hotel*diaria)+(nguia*vguia+onibus+taxa+guialocal)/32
              escreval("")
              escreval("O Custo por passagem é: R$", ticket2)
              ticket2<- ticket2+(ticket2* lucro/100)
              escreval("O Valor a ser cobrado por passagem é: R$",ticket2)
              escreva("")
      fimse
   escreva("")
   escreval("--------------------------------------")
   escreval("Para recalcular digite: [1]+[ENTER]")
   escreval("e para sair digite [ENTER]")
   escreval("--------------------------------------")
   leia(x)
   ate x<>1
   
Fimalgoritmo