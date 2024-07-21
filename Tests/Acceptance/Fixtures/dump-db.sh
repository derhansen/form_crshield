#!/bin/sh

mysqldump --no-data -u$DB_USERNAME -p$DB_PASSWORD_V8 -h127.0.0.1 --port 3406 typo3_formcrshield_acceptance_v13 > typo3.sql
mysqldump --no-create-info \
          --ignore-table=typo3_formcrshield_acceptance_v13.sys_log \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_hash \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_hash_tags \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_pages \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_pages_tags \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_imagesizes \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_imagesizes_tags \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_pagesection \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_pagesection_tags \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_rootline \
          --ignore-table=typo3_formcrshield_acceptance_v13.cache_rootline_tags \
          --ignore-table=typo3_formcrshield_acceptance_v13.tx_extensionmanager_domain_model_extension \
          --ignore-table=typo3_formcrshield_acceptance_v13.sys_http_report \
          -u$DB_USERNAME -p$DB_PASSWORD_V8 -h127.0.0.1 --port 3406 typo3_formcrshield_acceptance_v13 >> typo3.sql
