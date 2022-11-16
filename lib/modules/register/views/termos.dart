import 'package:flutter/material.dart';
import 'package:get/get.dart';

class termosUso extends StatefulWidget {
  _termosUso createState() => _termosUso();
}

class _termosUso extends State<termosUso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Termos e Política',
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const [
              Text('Você deve ler e concordar com nossos termos de uso (o "contrato"), pois este constitui o contrato vinculativo entre você e o I-JOB.  '),
              SizedBox(height: 20),
              Text('Aceitação dos Termos de uso.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'Este documento visa registrar a manifestação livre, informada e inequívoca pela qual o titular concorda com o tratamento de seus dados pessoais para finalidade específica, em conformidade com a Lei nº 13.709 – Lei Geral de Proteção de Dados Pessoais (LGPD). \n Informamos que coletamos seus dados pessoais (Nome, Telefone, E-mail, CPF) para Cupom Fiscal, Controle de vendas por clientes dentro da ferramenta. Os seus dados pessoais serão armazenados e preservados por um período indeterminado; os dados dos clientes são registrados no sistema e podem ser anonimizados a qualquer momento, desde que o cliente solicite. \n\n Você poderá, a qualquer momento:'),
              Text(
                  '\nTer acesso às informações sobre a forma e a duração de tratamento dos seus dados na nossa plataforma; \nSolicitar a atualização ou correção dos seus dados; \nSolicitar a eliminação dos seus dados pessoais tratados e revogação do consentimento, nos termos da Lei. \nAs solicitações e questionamentos acerca do tratamento e eliminação de seus dados deverão ser realizadas através do [informe seu e-mail ou telefone]. \nSe você não aceita e não concorda em vincular-se aos termos deste Contrato, não utilize o nosso Serviço. Podemos alterar este Contrato e o Serviço periodicamente. Podemos fazê-lo por diversas razões, inclusive para refletir as alterações ou exigências legais, novos recursos ou mudanças nas práticas comerciais. A versão mais recente é a que se aplica. \nSe as alterações incluírem emendas significativas que afetam os seus direitos ou obrigações, você será notificado antecipadamente a respeito, por meios razoáveis, o que pode incluir notificação por meio do Serviço ou por e-mail. Se você continuar a utilizar o Serviço após as alterações entrarem em vigor, isso significa que você concorda com o Contrato revisado. \n'),
              SizedBox(height: 20),
              Text('Qualificação.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'Você deve ter, no mínimo, 18 anos de idade para criar uma conta no I-JOB e utilizar o Serviço. Ao criar uma conta e utilizar o Serviço, você declara e garante que: \nVocê pode firmar um contrato vinculativo com a I-JOB. \nCumprirá este Contrato e todas as leis, normas e regulamentos municipais, estaduais, nacionais e internacionais aplicáveis. \n Você nunca foi condenado por crime ou ofensa grave (ou qualquer crime de mesma gravidade), crime de assédio sexual, ou qualquer crime que envolva violência, roubo ou furto. \n'),
              SizedBox(height: 20),
              Text('Sua conta.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'Para usar o I-JOB, você pode acessar usando suas credenciais do Facebook e do Google. Se o fizer, você nos autoriza a acessar e utilizar determinadas informações das suas contas, inclusive, entre outras. Para saber mais sobre as informações que coletamos de você e como as utilizamos, consulte a nossa Política de Privacidade. \nVocê é responsável por manter a confidencialidade de suas credenciais de login que utilizara para se conectar ao I-JOB, além de ser o único responsável por todas as atividades associadas ao uso dessas credenciais. Se você acredita que alguém obteve acesso à sua conta, entre em contato conosco imediatamente. \n'),
              SizedBox(height: 20),
              Text('Alteração do Serviço e Rescisão.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'O I-JOB está empenhado em melhorar o Serviço e a oferecer funcionalidades adicionais que possam ser úteis e interessantes para você. Podemos até mesmo suspender totalmente o Serviço, caso em que você será notificado com antecedência, a menos que circunstâncias atenuantes, como questões de segurança, impeçam-nos de fazê-lo. O I-JOB poderá cancelar sua conta a qualquer momento, sem aviso prévio, se acreditar que você violou este Contrato. \n'),
              SizedBox(height: 20),
              Text('Segurança; suas interações com outros membros.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'Embora o I-JOB se esforce para incentivar uma experiência de membro com respeito, por meio de recursos como a dupla aceitação, que permite aos membros se comunicarem apenas se ambos tiverem interesse um pelo outro, não somos responsáveis pela conduta do membro dentro ou fora do Serviço. Você concorda em agir com cautela em todas as interações com outros membros, especialmente ao decidir se comunicar fora do Serviço ou pessoalmente. \nVocê é o único responsável por suas interações com outros membros. Você compreende que o I-JOB não investiga os antecedentes criminais dos membros, nem verifica o histórico dos membros. O I-JOB não manifesta declarações ou garantias em relação à conduta dos membros. \n'),
              SizedBox(height: 20),
              Text('Conteúdo de outros membros.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'Embora o I-JOB reserve-se no direito de revisar e remover o Conteúdo que viola este Contrato, o referido Conteúdo é de exclusiva responsabilidade do membro que o publica, e o I-JOB não pode garantir que todo o Conteúdo cumprirá com este Contrato. Se você se deparar com algum Conteúdo no Serviço que implique na violação deste Contrato, informe o problema diretamente para nossa equipe de suporte. \n'),
              SizedBox(height: 20),
              Text('Isenção de responsabilidade.', style: TextStyle(fontSize: 20)),
              SizedBox(height: 10),
              Text(
                  'nível” e na extensão permitida pela lei aplicável, não concede garantias de qualquer tipo, expressas, implícitas, estatutárias ou de outra forma com relação ao serviço (incluindo todo o conteúdo contido no mesmo) inclusive, entre outras, garantias implícitas de qualidade satisfatória, comercialização, adequação a um determinado fim ou não violação. O I-JOB não declara ou garante que (a) o serviço será ininterrupto, seguro ou livre de erros, (b) quaisquer defeitos ou erros no serviço serão corrigidos, ou (c) que qualquer conteúdo ou informação que você obtenha no ou através do serviço serão precisas.\nO I-JOB não assume nenhuma responsabilidade por qualquer conteúdo que você, outros membros ou terceiros publicam, enviam ou recebem através do serviço. Qualquer material baixado ou, de outra forma, obtido através do uso do serviço, é acessado por sua própria conta e risco. \n')
            ],
          ),
        ),
      ),
    );
  }
}
