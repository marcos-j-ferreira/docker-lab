from flask import Flask, request, render_template_string

app = Flask(__name__)

# HTML do formulário
FORM_HTML = """
<!DOCTYPE html>
<html>
<head>
    <title>Salvar Texto</title>
</head>
<body>
    <h1>Digite seu texto</h1>
    <form method="POST" action="/salvar">
        <textarea name="texto" rows="5" cols="50"></textarea><br>
        <input type="submit" value="Salvar">
    </form>
    {% if mensagem %}
        <p>{{ mensagem }}</p>
    {% endif %}
</body>
</html>
"""

@app.route('/')
def index():
    return render_template_string(FORM_HTML)

@app.route('/salvar', methods=['POST'])
def salvar():
    texto = request.form.get('texto')
    if texto:
        try:
            with open('./data/saida.txt', 'a', encoding='utf-8') as arquivo:
                arquivo.write(texto + '\n')
            mensagem = "Texto salvo com sucesso!"
        except Exception as e:
            mensagem = f"Erro ao salvar: {str(e)}"
    else:
        mensagem = "Nenhum texto foi digitado."
    return render_template_string(FORM_HTML, mensagem=mensagem)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
