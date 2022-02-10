namespace :cria_relatorio do
	task import: :environment do
        Intranet::RelatoriosContribuicao.create(errors_logs: 'Sem erros.', data: '2021-05-31', status: 'sucesso', url_link: 'url_xls')
    end
end
