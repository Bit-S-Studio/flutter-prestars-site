class ConstantsStrings {
  static String waitTokenTitle(String? name) =>
      (name != null && name.isNotEmpty) ? 'Tudo certo, $name' : "Tudo certo!";
  static const String disableTitle =
      'Ao executar essa ação, você não receberá mais e-mails com as vagas publicadas nos editais IDEAS.';
  static const String disableSubTitle = 'Deseja continuar?';
  static const String disableBody =
      'Em breve você receberá um código de cancelamento de inscrição em seu e-mail. Seu cadastro continuará existindo na base IDEAS para um futuro retorno.';
  static String waitTokenSubTitle(bool isRegister) =>
      isRegister ? 'Agradecemos o seu cadastro' : 'Agradecemos a sua visita.';
  static String waitTokenBody(bool isRegister) => isRegister
      ? 'Em breve você receberá um código de acesso em seu e-mail para concluir o seu cadastro.'
      : 'Em breve você receberá um código de acesso em seu e-mail para concluir a sua autentificação.';
  static const String waitTokenResendFirst = 'Caso não tenha recebido, ';
  static const String waitTokenResendSecond = 'clique aqui ';
  static const String waitTokenResendThird = 'e reenviaremos.';
  static String registrationTitle(bool isEdit) =>
      isEdit ? 'Edite seu cadastro' : 'Crie seu cadastro';
  static const String registrationSubtitle =
      "Para concluir seu cadastro preencha os dados abaixo.";
  static const String successDialogTitle = 'Cadastro concluído com sucesso!';
  static const String successEditDialogTitle = 'Cadastro editado com sucesso!';
  static const String cancelRegistrationDialogSubTitle =
      'Você tem certeza que quer ir embora?';
  static const String cancelRegistrationDialogTitle =
      'Ao executar essa ação, todos os seus dados serão excluidos permanentemente do nosso sistema.';
  static const String desactiveRegistrationDialogSubTitle =
      'Você tem certeza que não quer mais receber nossas oportunidades?';
  static const String reactiveRegistrationDialogSubTitle =
      'Você quer reativar o recebimento de e-mails e voltar a receber oportunidades de vagas?';
  static const String desactiveRegistrationDialogTitle =
      'Ao executar essa ação, você não receberá mais informações de vagas e editais no seu e-mail.';
  static const String reactiveRegistrationDialogTitle =
      'Anteriormente você inativou o recebimento de e-mails com vagas e editais do IDEAS.';
  static const String registrationPopUp =
      "Preencha com as suas informações para ter acesso aos editais.";
  static const String firstRegisterPopUp =
      'Preencha com as suas informações para ter acesso aos editais.';
  static const String tryAgain = "Tentar novamente";
  static const String close = "Fechar";
  static const String defaultErrorMessage = "Ocorreu um erro";
  static const String defaultErrorDetails = "Por favor tente novamente";
  static String welcome = 'Bem vindo ao ';
  static String title = 'Shop das Peças';
  static String welcomeComplete = 'Bem vindo ao Shop das Peças';
  static String firstName(String? name) => name ?? ''.split(" ")[0];
  static const String changeRegister = "Editar cadastro";
  static const String cancelRegistration = "Excluir cadastro";
  static const String cancelRegistrationSuccess =
      "A exclusão do seu cadastro foi concluída com sucesso!";
  static const String reactiveRegistrationSuccess =
      "A sua inscrição foi reativada com sucesso!";
  static const String activeRegister = "Ativar cadastro";
  static const String findRegisters = "Buscar cadastros";
  static const String adminInterests = 'Gerenciar áreas de interesse';
  static const String myInterests = "Meus Interesses";
  static const String exit = "Sair";
  static String interestsTitle(bool isEdit) => isEdit
      ? 'Altere seus dados profissionais.'
      : "Falta pouco! Preencha seus dados profissionais.";

  static String interestsAdv =
      'Você pode se inscrever em mais de uma área de interesse.';
  static const String successSubmitInterests =
      "Área de interesse cadastrada com sucesso!";
  static const String successSubmitUpdateInterests =
      "Área de interesse editada com sucesso!";
  static const String successtIsActiveInterest =
      "Status da área de interesse alterado com sucesso!";
  static const String waitTokenResend = "Enviado o Código de acesso novamente";
  static const String errorCPF = "CPF inválido";
  static const String startPage =
      "Cadastre-se e seja informado sobre a abertura de editais na sua área de interesse!";
  static const String registerTitle =
      "Insira seus dados para completar seu cadastro.";
  static const String errorWaitToken = "O código está incorreto";
  static const String dataComplements = "Dados complementares";
  static const String dataExtras = "Dados extras";
  static const String address = "Endereço";
  static const String addresses = "Endereços";
  static const String emptyInterests =
      "*Nenhum interesse identificado com essas especificações.";
  static const String emptyFind =
      "*Nenhum cadastro identificado com essas especificações.";
  static const String back = "Voltar";
  static const String required = "Campos obrigatórios*";
  static const String policyFirst = "Ao criar o seu cadastro, você concorda com o nossa ";
  static const String policySecond = "Politica de Privacidade";
  static const String loginFirst = "Já tem cadastro? ";
  static const String loginSecond = "Login";
}
