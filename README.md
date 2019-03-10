Instruções de instalação e configuração
<ul>
<li>
<p>Criar a app nilo-os usando o banco de dados mysql</p>
<code>rails new nilo-os -d mysql</code>
<li>
<li>
<p>Instalar as Gems na pasta vendor/blunde ignorando as Gemns do ambiente de produção</p>
<code>bundle install --path vendor/bundle --without production</code>
<li>
<li>
<p>Configurar as informações de acesso ao banco de dados username e password no arquivo nilo-os/config/databases.yml</p>
<li>
<li>
<p>Criar o banco de dados: nilo-os_development e nilo-os_test</p>
<code>rails db:create</code>
<li>
<p>Criar as tableas no banco de dados</p>
<code>rails db:migrate</code>
<li>
<li>
<p>Inicia o servidor rails em localhost:3000</p>
<code>rails server</code>
<li>
</ul>
