import matplotlib.pyplot as plt
import pandas as pd

# Configuration des styles
plt.style.use('default')
fig, axes = plt.subplots(3, 4, figsize=(20, 15))
axes = axes.flatten()

# Génération des graphiques pour chaque mois
for i, month in enumerate(range(1, 13)):
    # Filtrage des données pour le mois concerné
    monthly_data = df[df['mois'] == month].copy()
    monthly_data = monthly_data.sort_values('date')
    
    # Création des courbes
    axes[i].plot(monthly_data['date'], 
                 monthly_data['nombre entrees HO'], 
                 label='Entrées entreprise', 
                 color='tab:blue',
                 linewidth=2)
    
    axes[i].plot(monthly_data['date'], 
                 monthly_data['nombre entrees cantine'], 
                 label='Entrées cantine', 
                 color='tab:red',
                 linewidth=2)
    
    # Ligne de référence à 400
    axes[i].axhline(y=400, 
                    color='black', 
                    linestyle='--', 
                    alpha=0.8,
                    label='Seuil 400')
    
    # Configuration des éléments graphiques
    axes[i].set_title(f'Mois {month}', fontsize=14, fontweight='bold')
    axes[i].set_xlabel('Date')
    axes[i].set_ylabel('Nombre d\'entrées')
    axes[i].legend(loc='upper left')
    axes[i].grid(True, alpha=0.3)
    
    # Format des dates sur l'axe x
    axes[i].tick_params(axis='x', rotation=45)
    axes[i].xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%Y-%m'))

# Ajustement final
plt.tight_layout()
plt.show()
