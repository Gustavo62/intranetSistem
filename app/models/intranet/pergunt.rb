class Intranet::Pergunt < ApplicationRecord 
    def self.consulta_por_status(status)
        if status.present?
            if status == '0'       
                where.not(mensagem_resposta: nil)
            else
                where(mensagem_resposta: nil)
            end
        else
            all
        end
    end
    def self.consulta_por_palavra(palavra_1,intecec_1,palavra_2,intecec_2,palavra_3)
        if palavra_1.present? && palavra_1.blank? == false
            if palavra_2.present? && palavra_2.blank? == false
                if palavra_3.present? && palavra_3.blank? == false
                    where("lower(assunto) LIKE ? #{intecec_1.upcase} lower(assunto) LIKE ?  #{intecec_2.upcase} lower(assunto) LIKE ? ", "%#{palavra_1.downcase}%","%#{palavra_2.downcase}%", "%#{palavra_3.downcase}%")
                else
                    where("lower(assunto) LIKE ? #{intecec_1.upcase} lower(assunto) LIKE ? ", "%#{palavra_1.downcase}%", "%#{palavra_2.downcase}%")
                end
            else 
                where("lower(assunto) LIKE ?", "%#{palavra_1.downcase}%")
            end
        else
            all
        end 
    end
end
