USE musimundos_V2;

SELECT * FROM categorias;

SELECT `cancoes`.`nome` as `NomeCancao`, `tipos_de_arquivo`.`nome` as `TipoArquivo`
FROM `cancoes`
RIGHT JOIN `tipos_de_arquivo` ON `cancoes`.`id_tipo_de_arquivo` = `tipos_de_arquivo`.`id`;