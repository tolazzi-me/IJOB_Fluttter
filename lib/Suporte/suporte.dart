import 'package:flutter/material.dart';
import 'package:formulario/Suporte/feedback.dart';

class suporte extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Suporte',
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
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Dica de segurança',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text(
                  '   Verifique sempre a avaliação do usuário, busque informações em outras redes sociais, cuidando com valores diferentes do normal, avise amigos e familiares sobre o trabalho que está aceitando.',
                  style: TextStyle(color: Colors.grey, fontSize: 17),
                ),
                const SizedBox(height: 35),
                const Text('Perguntas frequentes',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                const ExpansionTile(
                  title: Text('Como melhoro minha avaliação?',
                      style: TextStyle(fontSize: 20)),
                  initiallyExpanded: true,
                  children: [
                    Text(
                        '   A cada trabalho que você aceita e finaliza, o empregador pode te avaliar pelo trabalho, uma média é calculada juntando todas as avaliações que você recebeu e aloca em seu perfil, finalizar seus trabalhos com sucesso lhe dará uma maior chance de ter uma avaliação melhor',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    SizedBox(height: 10),
                  ],
                ),
                const ExpansionTile(
                  title: Text('Como aceito trabalhos?',
                      style: TextStyle(fontSize: 20)),
                  children: [
                    Text(
                        '   Ao clicar no botão verde na tela inicial, o trabalho ja estará aceito, se o empregador gostar de você e te mandará uma mensagem para combinar sobre o serviço.',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    SizedBox(height: 10),
                  ],
                ),
                const ExpansionTile(
                  title: Text('Como mudo minha senha?',
                      style: TextStyle(fontSize: 20)),
                  children: [
                    Text(
                        '   Ao abrir a tela do seu perfil pode clicar na opção em baixo chamada "Documentação e segurança, logo verá o botão para redefinir sua senha."',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    SizedBox(height: 10),
                  ],
                ),
                const ExpansionTile(
                  title: Text('Como ofereço um trabalho?',
                      style: TextStyle(fontSize: 20)),
                  children: [
                    Text(
                        '   Para oferecer trabalhos terá que possuir uma conta de empregador, ao clicar no botão com o simbolo "+" no canto inferior direito, a tela de adicionar um novo  trabalho se abrirá, então é só preencher os dados.',
                        style: TextStyle(color: Colors.grey, fontSize: 16)),
                    SizedBox(height: 10),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Em caso de dúvida...',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const Text('contato@ijob.com',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    height: 40,
                    width: 270,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => feedback())));
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.amberAccent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        child: const Text(
                          'Envie-nos um feedback',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('Política de privacidade')),
                    TextButton(
                        onPressed: () {}, child: Text('Termos de serviço'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
