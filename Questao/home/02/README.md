Claro! Em MATLAB, se você tem duas matrizes \( A \) e \( B \), e deseja calcular o produto da **inversa de \( A \)** por \( B \), ou seja:

\[
X = A^{-1} \cdot B
\]

o **modo correto e numericamente estável** de fazer isso **não é calcular diretamente `inv(A) * B`**, mas sim **usar o operador de divisão à esquerda**:

---

### ✅ **Forma recomendada:**

```matlab
X = A \ B;  % resolve o sistema A * X = B
```

---

### 🚫 **Forma direta (menos estável numericamente):**

```matlab
X = inv(A) * B;
```

> Essa forma funciona, mas é **menos eficiente e pode introduzir erros numéricos**. O MATLAB recomenda sempre usar `\` para resolver esse tipo de operação.

---

### 🔹 Exemplo completo:

```matlab
A = [2 1; 3 4];
B = [5; 6];

X = A \ B;  % equivalente a inv(A) * B

disp(X);
```

---

Se quiser também o caso simbólico com `syms` ou testar se \(A\) é inversível, posso mostrar isso também. Deseja?
